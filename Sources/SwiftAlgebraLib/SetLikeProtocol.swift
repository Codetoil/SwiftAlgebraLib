//  SwiftAlgebraLib is a library adding abstract algebra to swift.
//
//  Copyright (C) 2024 Anthony Michalek
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import Foundation

public protocol SetProtocol<Element>: Hashable
{
    associatedtype Element: Hashable;
    func contains(_ member: Element) -> Bool;
    func union(_ other: some SetProtocol) -> any SetProtocol;
    func intersection(_ other: some SetProtocol) -> any SetProtocol;
    func symmetricDifference(_ other: some SetProtocol) -> any SetProtocol;
    func isStrictSubset(_ of: some SetProtocol) -> Bool;
    func isStrictSuperset(_ of: some SetProtocol) -> Bool;
    func isSubset(_ of: some SetProtocol) -> Bool;
    func isSuperset(_ of: some SetProtocol) -> Bool;
    func isDisjoint(_ with: some SetProtocol) -> Bool;
    func subtracting(_ other: some SetProtocol) -> any SetProtocol;
}

extension Set: SetProtocol where Set.Element == Element
{
    public func union(_ other: some SetProtocol) -> any SetProtocol
    {

    }
    public func intersection(_ other: some SetProtocol) -> any SetProtocol
    {

    }
    public func symmetricDifference(_ other: some SetProtocol) -> any SetProtocol
    {

    }
    public func isStrictSubset(_ of: some SetProtocol) -> Bool
    {

    }
    public func isStrictSuperset(_ of: some SetProtocol) -> Bool
    {

    }
    public func isSubset(_ of: some SetProtocol) -> Bool
    {

    }
    public func isSuperset(_ of: some SetProtocol) -> Bool
    {

    }
    public func isDisjoint(_ with: some SetProtocol) -> Bool
    {

    }
    public func subtracting(_ other: some SetProtocol) -> any SetProtocol
    {

    }
}

public protocol TopologicalSpaceProtocol: SetProtocol
{
    static func base(point: Element) -> any BaseProtocol<Self>;
    func subtraction(_ clpenSet: some ClopenSetProtocol<Self>) -> any ClopenSetProtocol<Self>;
    func subtraction(_ closedSet: some ClosedSetProtocol<Self>) -> any OpenSetProtocol<Self>;
    func subtraction(_ openSet: some OpenSetProtocol<Self>) -> any ClosedSetProtocol<Self>;
}

public protocol BaseProtocol<TopologicalSpaceType>: SetProtocol
{
    associatedtype TopologicalSpaceType: TopologicalSpaceProtocol;
    func contains(_ openSet: some OpenSetProtocol<TopologicalSpaceType>) -> Bool;
}

public protocol OpenSetProtocol<TopologicalSpaceType>: SetProtocol
{
    associatedtype TopologicalSpaceType: TopologicalSpaceProtocol;
    func union(_ other: some OpenSetProtocol<TopologicalSpaceType>) -> any OpenSetProtocol<TopologicalSpaceType>;
    func intersection(_ other: some OpenSetProtocol<TopologicalSpaceType>) -> any OpenSetProtocol<TopologicalSpaceType>;
}

public protocol ClosedSetProtocol<TopologicalSpaceType>: SetProtocol
{
    associatedtype TopologicalSpaceType: TopologicalSpaceProtocol;
    func union(_ other: some ClosedSetProtocol<TopologicalSpaceType>) -> any ClosedSetProtocol<TopologicalSpaceType>;
    func intersection(_ other: some ClosedSetProtocol<TopologicalSpaceType>) -> any ClosedSetProtocol<TopologicalSpaceType>;
}

public protocol ClopenSetProtocol<TopologicalSpaceType>: OpenSetProtocol, ClosedSetProtocol
{
    func union(_ other: some ClopenSetProtocol<TopologicalSpaceType>) -> any ClopenSetProtocol<TopologicalSpaceType>;
    func intersection(_ other: some ClopenSetProtocol<TopologicalSpaceType>) -> any ClopenSetProtocol<TopologicalSpaceType>;
}